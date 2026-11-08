class Agx < Formula
  version "10.0.2"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.2/agx-10.0.2-darwin-arm64.tar.gz"
      sha256 "0a74f3c67eb88005cf888a489142a0aa3396d479a533b836aa8ae379edfccabc"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.2/agx-10.0.2-darwin-x64.tar.gz"
      sha256 "e6102cf2a0ad510de8283961e5658b849a3f54676fa2723846256b0e92d106f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.2/agx-10.0.2-linux-arm64.tar.gz"
      sha256 "d14aec02d6fd39e1b66d25c2a5a2852fb6109c0ec2b4ade770aa2018adeb0909"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.0.2/agx-10.0.2-linux-x64.tar.gz"
      sha256 "5f7e50b4bdf5359ec457c58386680ca0995eb29d71ca0d48a8f054de17231ddd"
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
