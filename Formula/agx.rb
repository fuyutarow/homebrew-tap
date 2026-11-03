class Agx < Formula
  version "1.22.87"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.87/agx-1.22.87-darwin-arm64.tar.gz"
      sha256 "899c9a4c01a59a11cff97bfc5900c59fd4a3b6f125eaeb53b65f5127654c63cf"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.87/agx-1.22.87-darwin-x64.tar.gz"
      sha256 "525903696e403cbfccd7593b428616509571ae9b26ce82a0174ca84909fae398"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.87/agx-1.22.87-linux-arm64.tar.gz"
      sha256 "0590d064ecd941eb3bb10b843975720b82177fd3eb5f00c1bc3c6734cb5c101d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.87/agx-1.22.87-linux-x64.tar.gz"
      sha256 "6392e5a23575c346cc1bff04e7301774884d03f09d7306f9c4341156a82a0e85"
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
