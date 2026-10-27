class Agx < Formula
  version "1.18.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.18.1/agx-1.18.1-darwin-arm64.tar.gz"
      sha256 "66b6083e72dbf04c79764d7a46376d65e02c6703e2dce50607519d2f84b2eec4"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.18.1/agx-1.18.1-darwin-x64.tar.gz"
      sha256 "935b81a0765abf4ddadd80905dcf460bfc2192ab35abe122123923d2007615a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.18.1/agx-1.18.1-linux-arm64.tar.gz"
      sha256 "25b5003821d4ea0c4c3c15e3ce4e25836671435fedfab4512e1826d1def90987"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.18.1/agx-1.18.1-linux-x64.tar.gz"
      sha256 "9a8b7c998715e56def25232a99b02712d98f2a110889cf7ddec479dbe9077a70"
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
