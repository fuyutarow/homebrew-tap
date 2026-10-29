class Agx < Formula
  version "1.22.20"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.20/agx-1.22.20-darwin-arm64.tar.gz"
      sha256 "9d1756cc7a19bdf09f1aeb9ee1b3da8b6d9f0661448c739e9b1a8ac502659ebf"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.20/agx-1.22.20-darwin-x64.tar.gz"
      sha256 "3d29a1c3b933dca74c362c075568b7d1fa5ded7efe53b6c89417632518b351d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.20/agx-1.22.20-linux-arm64.tar.gz"
      sha256 "9b9266c169a5daec28454c0d8992627b105f9eea579f230efe3e5f8df50f4404"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.20/agx-1.22.20-linux-x64.tar.gz"
      sha256 "f61909362083bfe99d97c0bd3b49e852db98d8dfeb429960f328056a6e7010e2"
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
