class Agx < Formula
  version "1.12.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.12.1/agx-1.12.1-darwin-arm64.tar.gz"
      sha256 "c6f8bedb4140b0492866178cc1559ad1b75b8a1017a891b8128dff504df3c776"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.12.1/agx-1.12.1-darwin-x64.tar.gz"
      sha256 "c52c4199fb99bb3b68c543dc6f96c4d8da895ad4eb7234f72c9acb9a1e0f1eb7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.12.1/agx-1.12.1-linux-arm64.tar.gz"
      sha256 "91304cec910f93656f43db5d4c2ea0cf892ad6e770df0cbf82d49e93720a4e6d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.12.1/agx-1.12.1-linux-x64.tar.gz"
      sha256 "18d10b962f3d5578adfc1a222a952bcfd75b69473fa39f9dbfdc82ff2389be5e"
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
