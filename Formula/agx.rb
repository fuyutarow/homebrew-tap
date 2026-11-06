class Agx < Formula
  version "4.1.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v4.1.0/agx-4.1.0-darwin-arm64.tar.gz"
      sha256 "c81fbc24094b22c3f4a42a335570ff1c481eba610cda52499ccbfa59c895cd05"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v4.1.0/agx-4.1.0-darwin-x64.tar.gz"
      sha256 "c55a6d419cd239af6f4c96355609924b206e6d514036ae724764943dabd201dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v4.1.0/agx-4.1.0-linux-arm64.tar.gz"
      sha256 "37778d63bf1164eb2981f7b5a4c4cc0c43599bb15ef5b82ec56554bfdab49dbd"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v4.1.0/agx-4.1.0-linux-x64.tar.gz"
      sha256 "5f196b4c7b4dfd0a0fca2cd93167ee4b16fbbdae021964367a31127c8a2abc0c"
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
