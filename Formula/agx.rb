class Agx < Formula
  version "1.22.102"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.102/agx-1.22.102-darwin-arm64.tar.gz"
      sha256 "a1a935f100312d163595bd63c9e5fee2cabf9d225317f58784b9da95932da077"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.102/agx-1.22.102-darwin-x64.tar.gz"
      sha256 "66a3b501c6a9548b02d6209c0624f07a00dc13445f04f6d147a524fb63c8101b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.102/agx-1.22.102-linux-arm64.tar.gz"
      sha256 "711d7c9a41f003305a73e49c61b38a078ebd3deeba16541cc28e59df81f39eda"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.102/agx-1.22.102-linux-x64.tar.gz"
      sha256 "24bb720846e8db2b856a2fa1d25b6f8f8bfb28f83003fd962d69588c60896c4e"
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
