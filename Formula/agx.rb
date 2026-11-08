class Agx < Formula
  version "10.0.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.0/agx-10.0.0-darwin-arm64.tar.gz"
      sha256 "1bf98eab1f3eac3666a8c94a706ffee038bb2c36770317b04af4cb0b9b5b998c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.0/agx-10.0.0-darwin-x64.tar.gz"
      sha256 "6201fe731dc48e1c8c16fdf54c65c4b435c1069d19bfdfd16a8c931ac53f2e5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.0/agx-10.0.0-linux-arm64.tar.gz"
      sha256 "9f935bc791b09de3a9b09713e5229a9b2b44dbd904b7175b3ae0d7d9492b8e58"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.0/agx-10.0.0-linux-x64.tar.gz"
      sha256 "7e06755cd44b258301feebca0f32098ab1d7685429df37182d5550755c5f0af2"
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
