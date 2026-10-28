class Agx < Formula
  version "1.22.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.0/agx-1.22.0-darwin-arm64.tar.gz"
      sha256 "b7346dae0b5147ce3dfeddd883362e09b5d24e5ace470bd122ff8c6bf9046593"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.0/agx-1.22.0-darwin-x64.tar.gz"
      sha256 "a157ee4c40b9f1abe6fe0e4b73ca0e725d81f90e509cdb1e0a8c456f2fa4e7d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.0/agx-1.22.0-linux-arm64.tar.gz"
      sha256 "36f3dee7bda9a70b0e2c071bcc19c4d78ea84d8b88ceb4d0b8f156fcb3345b41"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.0/agx-1.22.0-linux-x64.tar.gz"
      sha256 "89e925119ba5167b6d251a8e68219862adb733120ced17dd27503d96e39158a7"
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
