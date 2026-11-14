class Agx < Formula
  version "11.2.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.2.0/agx-11.2.0-darwin-arm64.tar.gz"
      sha256 "076061b06ae674a308b1e226fe45cedacf83747db78f1880c30e5dede4d6d7d1"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.2.0/agx-11.2.0-darwin-x64.tar.gz"
      sha256 "0d7fc455f1221e7da04ed7bb8d718b092d567c2d89f8ccc93c6b7230209a5455"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.2.0/agx-11.2.0-linux-arm64.tar.gz"
      sha256 "90adf4228bb6affdac9eb79231993674f3b8ccba4044224b886d46f0d819c8ae"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.2.0/agx-11.2.0-linux-x64.tar.gz"
      sha256 "d7a609e2f30a8adbfee296a854125a04f6a0b1f398fdccefcc04ec697f175d4d"
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
