class Agx < Formula
  version "1.14.4"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.4/agx-1.14.4-darwin-arm64.tar.gz"
      sha256 "a7aa434b6129d9a33cd769f9735618954fa038c3b3335dc040055dadadd678a1"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.4/agx-1.14.4-darwin-x64.tar.gz"
      sha256 "f2add9eb61e313452e07f4742360ed1b950033c5fd54c382238314245da07295"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.4/agx-1.14.4-linux-arm64.tar.gz"
      sha256 "3738875d1c33baa6e49e07f71b16831f037845a7e66d8d88d92d345235b3b931"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.4/agx-1.14.4-linux-x64.tar.gz"
      sha256 "31b0508b390b3790ea00f13af779ceacf8ba00a12d4fb8f02234b87a7667e184"
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
