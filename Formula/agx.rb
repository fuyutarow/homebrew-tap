class Agx < Formula
  version "1.22.65"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.65/agx-1.22.65-darwin-arm64.tar.gz"
      sha256 "ca91fd02f3ba47bdb2e33ba41ec20d46e14811ad2669d5690df4864755e70d43"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.65/agx-1.22.65-darwin-x64.tar.gz"
      sha256 "dd7a68fa07b5340e3922487ac24160a79ee8886e75235f5bc24db8505adfdf2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.65/agx-1.22.65-linux-arm64.tar.gz"
      sha256 "0e0a9101c29ae49ffcc39322ed6815fe6e799be2d3271b8b7de30f574c40eae4"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.65/agx-1.22.65-linux-x64.tar.gz"
      sha256 "02a8b87e4aad06b101745e05ee8338fbb16cbca71054c46706adaf5e027eb73f"
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
