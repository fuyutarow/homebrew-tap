class Agx < Formula
  version "1.21.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.1/agx-1.21.1-darwin-arm64.tar.gz"
      sha256 "c3289960a1664bf2e8ced9bef484fe34051130aaade7712671d422c0f029e546"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.1/agx-1.21.1-darwin-x64.tar.gz"
      sha256 "4532881c61cf4ff5bb600ff77d051c4d3151e50c5dc8f5c61dfed6db621466ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.1/agx-1.21.1-linux-arm64.tar.gz"
      sha256 "ef2889e98856a91b57b5ad5d959f5e2a7a1fe555921c340dac81311e88155d1e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.1/agx-1.21.1-linux-x64.tar.gz"
      sha256 "af94f83301ee1af4b23d132151874f2e4bf758eb970ea231d9f71b89c355e41e"
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
