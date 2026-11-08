class Agx < Formula
  version "5.3.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.3.0/agx-5.3.0-darwin-arm64.tar.gz"
      sha256 "e05bc1a8d3ed85853b11a1132ff28c627675ba1e98135bc2b0f9fe90caadaef4"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.3.0/agx-5.3.0-darwin-x64.tar.gz"
      sha256 "30fda36f436cb93312683928657401c2cab6ac4daa855a4c303f842f10e80f51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.3.0/agx-5.3.0-linux-arm64.tar.gz"
      sha256 "d9848fa4eb3d8b6a7095b6f83aed82c2870724327c8dd66b33d866088fbdb4ee"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.3.0/agx-5.3.0-linux-x64.tar.gz"
      sha256 "61376fbc4894890ca18e1e8cedc03c71f87019c6a1278a52667460be57cbf28f"
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
