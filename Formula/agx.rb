class Agx < Formula
  version "1.22.49"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.49/agx-1.22.49-darwin-arm64.tar.gz"
      sha256 "e749ad21f0ec4d3054521bd205197e3bef13d3971a244a6898549dd3dfb65d23"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.49/agx-1.22.49-darwin-x64.tar.gz"
      sha256 "c9d016627909383348cc5f82272084c2a01f636cc7a8eb598a075df659a82fcc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.49/agx-1.22.49-linux-arm64.tar.gz"
      sha256 "b634bc3223ba7322c9084ed162f716adbc98645bd467d8a9fc0afbc8e1ec2c1d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.49/agx-1.22.49-linux-x64.tar.gz"
      sha256 "e88f829215f1ba2476f7505e6154857f850ca95d577d4f3a77ebd9118ef1cea4"
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
