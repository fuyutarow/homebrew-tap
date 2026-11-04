class Agx < Formula
  version "1.22.94"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.94/agx-1.22.94-darwin-arm64.tar.gz"
      sha256 "69fad9ad50258549747d5f968463c04b985a132171ee3e60aeee65b7d40fc0b5"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.94/agx-1.22.94-darwin-x64.tar.gz"
      sha256 "95eeb6592652508527e913c4ed943f4209cab4995cddf21a1db3dceae7d30e27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.94/agx-1.22.94-linux-arm64.tar.gz"
      sha256 "8a6a0182ab868a6f8ef7309d57924633f8395aae9af327ead754e706bb690fa6"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.94/agx-1.22.94-linux-x64.tar.gz"
      sha256 "0e00ed55ac3d9709a8f3e0813edd6319da5e26fd842a8296c1e6334752bb9550"
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
