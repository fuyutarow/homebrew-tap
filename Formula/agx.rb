class Agx < Formula
  version "5.4.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.4.1/agx-5.4.1-darwin-arm64.tar.gz"
      sha256 "44e511ca7370161d302b3c5cbc97b318c455439123cafafc7da734e73065b991"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.4.1/agx-5.4.1-darwin-x64.tar.gz"
      sha256 "7a47e69acdceee3754487e15c49fb6b1b4e62581fb23165d6a889779e35b8e68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.4.1/agx-5.4.1-linux-arm64.tar.gz"
      sha256 "0fd133f2970a6bcce4ef06fc64641b7afc937b98ec34e1e44bd76bc0d53a49e8"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.4.1/agx-5.4.1-linux-x64.tar.gz"
      sha256 "cd8dc2d706aafa0851c1778b470bc592602eac61b1f6eb6566d29e3d80a2adba"
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
