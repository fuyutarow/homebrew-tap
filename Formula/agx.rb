class Agx < Formula
  version "10.4.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.4.0/agx-10.4.0-darwin-arm64.tar.gz"
      sha256 "4fe55e75333e3b9f45f60ff5a36abdc82439a995b08f8fc00402db1473e2972e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.4.0/agx-10.4.0-darwin-x64.tar.gz"
      sha256 "3e9f80b0fe16575af2409f4385f7233a61daf1406ff7eef3549e00b0e63cc7bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.4.0/agx-10.4.0-linux-arm64.tar.gz"
      sha256 "7a8236585a1d48bbaf84fddd88fd61bf7e84fc6ecce181beb7b382691984e41d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.4.0/agx-10.4.0-linux-x64.tar.gz"
      sha256 "d75af30ac010ab83c5e39cbe738cc6d39a24a33149928635daceebac026bd6b1"
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
