class Agx < Formula
  version "1.22.28"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.28/agx-1.22.28-darwin-arm64.tar.gz"
      sha256 "59bf295719f669220b1c0d8fc3af8e31bf838b97474350a26278c516c963cc51"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.28/agx-1.22.28-darwin-x64.tar.gz"
      sha256 "2d0c2bdc0a1fa42a135c3a8a74a8fb8c79124a2f14684a870ad50f9e57480d88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.28/agx-1.22.28-linux-arm64.tar.gz"
      sha256 "18d628171ab484423d95ff994484a776a723565465eae3761e79841ca3204354"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.28/agx-1.22.28-linux-x64.tar.gz"
      sha256 "06839b202dd84726838ebb10a84607ecadb525e6b6ff910a49451db17177686b"
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
