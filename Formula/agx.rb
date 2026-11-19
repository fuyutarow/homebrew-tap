class Agx < Formula
  version "11.2.2"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.2.2/agx-11.2.2-darwin-arm64.tar.gz"
      sha256 "7fdd263a6025c568825a04ef4be2fa057f3a3b3dbc159df59c5f8c113d480602"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.2.2/agx-11.2.2-darwin-x64.tar.gz"
      sha256 "94cf3419371101bc5ec46d50cdd2c5585644364aad1cad9eea3d2c95327a0e83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.2.2/agx-11.2.2-linux-arm64.tar.gz"
      sha256 "a001d8caee45aed9bf0a0ffa7e2c95e85734611a68484c06272eecac4681ee20"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.2.2/agx-11.2.2-linux-x64.tar.gz"
      sha256 "08b0fe1a8736d96998289cc28b3eabb0a691e1ea5a9a6a028885f3dd71a6a739"
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
