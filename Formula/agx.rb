class Agx < Formula
  version "1.22.61"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.61/agx-1.22.61-darwin-arm64.tar.gz"
      sha256 "292cfd864c94035f404c2eff3932e581584df70c318c7461e0d99411cdf68ee6"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.61/agx-1.22.61-darwin-x64.tar.gz"
      sha256 "eafee6990e3a86c1623cea5f10f3b4acaa7dd4db3a2601b0f3b494f68eb888be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.61/agx-1.22.61-linux-arm64.tar.gz"
      sha256 "0eb670f07db1950fabc113a2b72cbd2533051617cf1516c3f3c77c5ca0ea6132"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.61/agx-1.22.61-linux-x64.tar.gz"
      sha256 "65fddbb757961a07df1b135e518b9bb174a323024b7d86ba4d16d6f34bb08c36"
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
