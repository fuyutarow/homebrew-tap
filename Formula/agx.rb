class Agx < Formula
  version "1.13.6"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.6/agx-1.13.6-darwin-arm64.tar.gz"
      sha256 "1c857c1dcee24fa9e21700e8d542aef15ef0727c6393bad13a1c20fcdc9204a2"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.6/agx-1.13.6-darwin-x64.tar.gz"
      sha256 "679206a3fccab38d91f8a930b8d97f4e476dcd2265260fd1b0d5fbcb45aac708"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.6/agx-1.13.6-linux-arm64.tar.gz"
      sha256 "0c491df56248f4577d23a031095d928cc6f9de94e8153111277914b9fff9bddb"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.6/agx-1.13.6-linux-x64.tar.gz"
      sha256 "35e74eaa5f12e5e41844e45fb7a14a795a0a6f9cafcce9bf557ca2dd17b43d1e"
    end
  end

  def install
    executables = Dir["*"].select { |path| File.file?(path) && File.executable?(path) }
    if executables.empty?
      executables = Dir["bin/*"].select { |path| File.file?(path) && File.executable?(path) }
    end
    raise "no executables found in archive" if executables.empty?

    bin.install executables.reject { |path| File.basename(path) == "xmsg" }
    bin.install_symlink "agx-msg" => "xmsg"
  end

  test do
    assert_equal "agx #{version}", shell_output("#{bin}/agx -V").strip
  end
end
