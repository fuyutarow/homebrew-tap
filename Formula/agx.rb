class Agx < Formula
  version "1.22.85"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.85/agx-1.22.85-darwin-arm64.tar.gz"
      sha256 "5082ea390615d30166f5f7b781b9b67e9be1985dc365ca9a173c0ea9afe87367"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.85/agx-1.22.85-darwin-x64.tar.gz"
      sha256 "3ad57b412c7a9a9f12f62c2fabe8d8dc84fde98b352f641611acd446f978af87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.85/agx-1.22.85-linux-arm64.tar.gz"
      sha256 "cf29ed0687dc268aa45422d94e7df54fa5f694f786fb019fc0e1fd0df7eefc1b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.85/agx-1.22.85-linux-x64.tar.gz"
      sha256 "a5df1c9630822c8e6449d798377ea63f5c5e3f94f6203e957e80f6f2456c394e"
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
