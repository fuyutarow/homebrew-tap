class Agx < Formula
  version "1.22.4"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.4/agx-1.22.4-darwin-arm64.tar.gz"
      sha256 "8857632efac7b018cc7fed437922a1f22ca1774b03bd69b7be0251797c852571"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.4/agx-1.22.4-darwin-x64.tar.gz"
      sha256 "5c6d18425f0437def56a017d70ac4df1ab1423a520cf4337ec84449375be20b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.4/agx-1.22.4-linux-arm64.tar.gz"
      sha256 "2cf743c8abaaee7930a1be70daa66986b56cd39ce226c6c47e83f2b968645e22"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.4/agx-1.22.4-linux-x64.tar.gz"
      sha256 "ae8bcf708041d2e8e0e74b1da6dabe3885e289adecf7b070cf56fef7d5947151"
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
