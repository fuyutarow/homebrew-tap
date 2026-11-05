class Agx < Formula
  version "1.22.101"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.101/agx-1.22.101-darwin-arm64.tar.gz"
      sha256 "893b69950de6869c2ae9ad15a39261a50123a915729bc6b32f6c9ce627f58dd7"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.101/agx-1.22.101-darwin-x64.tar.gz"
      sha256 "5ca698b9326e021a0767af683dcdf83a55d9d099d9ed33e6ec0b979f09fd737d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.101/agx-1.22.101-linux-arm64.tar.gz"
      sha256 "935e14dcd943f96d4ced553dc97c37559af96c4ca17f390e2c2555e9b48d5e3a"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.101/agx-1.22.101-linux-x64.tar.gz"
      sha256 "e65b091515564b0509871bad18119a184973103b10a08b09b717214065f431ff"
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
