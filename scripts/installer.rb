class Installer
  def initialize
    @dotfiles_root = Dir.getwd
    @dotfiles = []
    @overwrite_all = false
    @backup_all = false
    @skip_all = false
  end

  def link_files target, linkname
    FileUtils.ln_s target, linkname
    Printer.success "linked #{target} to #{linkname}"

  end

  def setup_commonFiles
    setup_commonFile 'vimrc'
    setup_commonFile 'gitk'
  end

  def setup_commonFile filename
    dest = "." + filename
    FileUtils.cp filename, dest
    @dotfiles.push(dest)
  end

  def setup_bashrc
    FileUtils.cp 'bash_aliases', '.bash_aliases'
    File.open(".bash_aliases", "a"){ |file|
      file.write "PATH=$PATH:#{@dotfiles_root}/bin"
    }
    @dotfiles.push(".bash_aliases")
  end

  def setup_gitconfig
    gitnameCacheFile = ".gitconfig.name" 

    if ! File.exists? gitnameCacheFile
      Printer.user "  - What is your github author name?"
      git_authorname = gets.chomp
      Printer.user "  - What is your github author email?"
      git_authoremail = gets.chomp

      File.open(gitnameCacheFile, "w"){|file|
        file.write "[user]\n"
        writeIfNonEmpty file, "name", git_authorname
        writeIfNonEmpty file, "email", git_authoremail
      }
    end

    concatFiles [gitnameCacheFile, "gitconfig"], ".gitconfig"
    @dotfiles.push(".gitconfig")
    Printer.success "gitconfig"
  end

  def writeIfNonEmpty file, key, value
    if value.length > 0
      file.write "  #{key} = #{value}\n"
    end
  end

  def concatFiles inputs, output
    File.open(output, "w"){|f_out|
      inputs.each{|f_name|
        File.open(f_name){|source|
          source.each{|line| f_out.puts(line)}
        }
      }
    }
  end

  def prepareFiles
    setup_gitconfig
    setup_commonFiles
    setup_bashrc
  end

  def install
    prepareFiles
    installFiles
  end

  def installFiles
    @dotfiles.each{ |dotfile| installFile dotfile }
  end

  def installFile dotfile
      source = @dotfiles_root + "/" + dotfile
      dest = Dir.home + "/" + dotfile

      if File.exists? dest
        overwrite = false
        backup = false
        skip = false

        if ( !@overwrite_all && !@backup_all && !@skip_all )
          Printer.user "File already exists: #{dotfile}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
          system("stty raw -echo")
          action = STDIN.getc()
          system("stty -raw echo")

          case action
            when "o"
              overwrite = true
            when "O"
              @overwrite_all = true
            when "b"
              backup = true
            when "B"
              @backup_all = true
            when "s"
              skip = true
            when "S"
              @skip_all = true
          end
        end

        if ( overwrite || @overwrite_all )
          FileUtils.rm dest
          Printer.success "removed " + dest
        end

        if ( backup || @backup_all )
          FileUtils.mv dest, dest + ".bak"
          Printer.success "moved " + dest + " to " + dest + ".bak"
        end

        if ( !skip && !@skip_all)
          link_files source, dest
        else
          Printer.success "skipped " + dotfile
        end
      else
        link_files source, dest
      end
  end
end

