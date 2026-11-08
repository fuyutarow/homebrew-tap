class Agx < Formula
  version "5.10.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.10.0/agx-5.10.0-darwin-arm64.tar.gz"
      sha256 "3bee6d3ace3917d69956d5f61d79a95700bfc2fbd4b078f1fe2cc6673c6dcbe4"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.10.0/agx-5.10.0-darwin-x64.tar.gz"
      sha256 "f2af88ccd5157ea3fcd283463dce3070cc6ed3a9ad4430bef8197b7772d023f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.10.0/agx-5.10.0-linux-arm64.tar.gz"
      sha256 "eb8566bbd2bc92c85c8f89df6605f03a96fa06dfafb9497fb4df8915e216dc12"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.10.0/agx-5.10.0-linux-x64.tar.gz"
      sha256 "f52724351bd417702b76aa29fe6711ca35f544df8a16bb5284a8516ec7141418"
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
