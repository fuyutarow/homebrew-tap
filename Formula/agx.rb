class Agx < Formula
  version "1.22.2"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.2/agx-1.22.2-darwin-arm64.tar.gz"
      sha256 "ca794a59c58449264f7797bf4f5a60b4a3238a1e23bf90e0bbf0109f2057af25"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.2/agx-1.22.2-darwin-x64.tar.gz"
      sha256 "375869c127e010ae8781d0d80e3804f0c1c09e4c29b00cc161493fea03a40038"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.2/agx-1.22.2-linux-arm64.tar.gz"
      sha256 "165ad050a069e5f708c89d6ff220da5b844d5455729a0dcff114e2412c5a4c09"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.2/agx-1.22.2-linux-x64.tar.gz"
      sha256 "7f33824612b0b274b2995f185bf4eb906ddcc5d099ee7eccda82c14df09f5c4a"
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
