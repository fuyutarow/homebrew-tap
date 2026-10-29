class Agx < Formula
  version "1.22.26"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.26/agx-1.22.26-darwin-arm64.tar.gz"
      sha256 "afce4972119b6e55042f19e763ca92f215d3c4f9d75f156f0c791fa724a57e11"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.26/agx-1.22.26-darwin-x64.tar.gz"
      sha256 "982951e4935be73b4b65d3283724a5b0ad67955be2a9b3afec191b6b0911dc2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.26/agx-1.22.26-linux-arm64.tar.gz"
      sha256 "457c7464dedad88c028e32ba335f8af4929145dfea3b2e2f94c27223e3a35e43"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.26/agx-1.22.26-linux-x64.tar.gz"
      sha256 "a67e58d2ae42f156473b95c47b23c744a0270addbc738ec986b8eeea5dabe087"
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
