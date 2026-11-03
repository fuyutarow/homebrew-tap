class Agx < Formula
  version "1.22.84"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.84/agx-1.22.84-darwin-arm64.tar.gz"
      sha256 "37fa33fc1d22fcbd97a831b19120a4188a079e43e2ae3063fac18747092e28e1"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.84/agx-1.22.84-darwin-x64.tar.gz"
      sha256 "58169d3e7c69ca63937271442820d0d194d7a2ecfa7754a705770e8409a7ab05"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.84/agx-1.22.84-linux-arm64.tar.gz"
      sha256 "b24fa97dd95cde64338032233c56428400eef92ce9b6f79eb4ecbcbbed19556c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.84/agx-1.22.84-linux-x64.tar.gz"
      sha256 "6c2617c48a15037bfc20966d827b80808bc5766e2fa8eaf49130ad883d3138cb"
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
