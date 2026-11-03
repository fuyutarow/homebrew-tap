class Agx < Formula
  version "1.22.71"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.71/agx-1.22.71-darwin-arm64.tar.gz"
      sha256 "9294e29da21e6c6253e5ddb1f0804f271297caf33fd7f574eac2bf581ffb93bf"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.71/agx-1.22.71-darwin-x64.tar.gz"
      sha256 "8104d14ab66d0efbf833513fc0341e733820ae3ec7a02a8b45518da52c2e2a99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.71/agx-1.22.71-linux-arm64.tar.gz"
      sha256 "182347a438776257f0865db5639c0737d0d69ede3249e06e1a49fa66d55e0a91"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.71/agx-1.22.71-linux-x64.tar.gz"
      sha256 "17ce2d54ad0077f2fb0e0eb322eedb91838fca7f3915aff997d46be66182d9a0"
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
