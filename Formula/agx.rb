class Agx < Formula
  version "1.13.10"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.10/agx-1.13.10-darwin-arm64.tar.gz"
      sha256 "619ec9a7d196690adedd0d9318ad5be898ee3c812c52d1f201b0d345311066cf"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.10/agx-1.13.10-darwin-x64.tar.gz"
      sha256 "ad0e51c2cce44f7f6b85e785c2bad661f55bb1e202ad45b1d1225fec8af7e4c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.10/agx-1.13.10-linux-arm64.tar.gz"
      sha256 "42a904606270db64ee06dce531a1ddda1ec22ea8f4a6a6ec0d28975c237beb1a"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.10/agx-1.13.10-linux-x64.tar.gz"
      sha256 "9dbc273b711cab420964e865569b26a2880d61480ed95d1920f030140385e8e8"
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
