class Agx < Formula
  version "11.2.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.2.1/agx-11.2.1-darwin-arm64.tar.gz"
      sha256 "34ef2cc54a2dc6ee051bfe11f5c8ffe0e71f05b7e583cfebe7d6c84744b610f8"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.2.1/agx-11.2.1-darwin-x64.tar.gz"
      sha256 "c14f5e350d423cefe54305a8a3fea2104a02b63fb8776d95af5315d220bdd640"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.2.1/agx-11.2.1-linux-arm64.tar.gz"
      sha256 "21ba8d919f4cac470eb96f1890ec8bc9a00d1a381dcbcdc8aefcb473df22bb6c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.2.1/agx-11.2.1-linux-x64.tar.gz"
      sha256 "23d17113891246900215166307e48d973b786fe58db7c2efecba66e000de35eb"
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
