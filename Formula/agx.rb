class Agx < Formula
  version "1.22.62"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.62/agx-1.22.62-darwin-arm64.tar.gz"
      sha256 "c9b572f3bd5aea9e70e8680822774cbfa1f70450001374a42626eaded98b7c6b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.62/agx-1.22.62-darwin-x64.tar.gz"
      sha256 "9dd24753bbce9bd67b57fdf8c1d7bbbd44a932028fa510effe72b47ad76df435"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.62/agx-1.22.62-linux-arm64.tar.gz"
      sha256 "935202d5b4530e327323e80c4c7832eefc008ee06bccbabb2be16814bbef494e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.62/agx-1.22.62-linux-x64.tar.gz"
      sha256 "d97f1ba75c1d798eef25a32ee40294aec1b911e9aef008959969d4fea362dfc0"
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
