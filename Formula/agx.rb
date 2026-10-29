class Agx < Formula
  version "1.22.10"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.10/agx-1.22.10-darwin-arm64.tar.gz"
      sha256 "f6b54d6e1b1c9b55eada5c2fb735371da1104385819e14620fcbe5f941163c7b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.10/agx-1.22.10-darwin-x64.tar.gz"
      sha256 "37b5a10d4efb03558d8ad1a9a4e3fccb9f0ca8873f916b9d8666caefeb5253ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.10/agx-1.22.10-linux-arm64.tar.gz"
      sha256 "def301b50cc2acc0222b1be8fb1517bbb38a1d59378477f043957b86df6d2515"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.10/agx-1.22.10-linux-x64.tar.gz"
      sha256 "2e53901ddfa3770e8df9db65e78221547e7264adbe3883b0d1c126c811afd031"
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
