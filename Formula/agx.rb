class Agx < Formula
  version "1.22.99"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.99/agx-1.22.99-darwin-arm64.tar.gz"
      sha256 "1b28ac3b6ce55b1a14d2053aa460ad05e2ed716c02d6347774a75222ceaf80f6"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.99/agx-1.22.99-darwin-x64.tar.gz"
      sha256 "061cb5f0e4bb10038defffbaee5e40dc4e073771251a97001b02bcedac7e29d2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.99/agx-1.22.99-linux-arm64.tar.gz"
      sha256 "c8648fda40cfe05f09ebf72a25ba8c683f33664bb7bf1934696fd5c8ce92b606"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.99/agx-1.22.99-linux-x64.tar.gz"
      sha256 "64b7599ed5f03bcf6b15f2e33315e5b9a247ce4ab8110400bc10f234f7f22383"
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
