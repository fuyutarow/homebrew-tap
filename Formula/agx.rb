class Agx < Formula
  version "1.13.5"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.5/agx-1.13.5-darwin-arm64.tar.gz"
      sha256 "926b66ed7b0f58dfec82e9b2924b6c56b55b63a0f12f6ac36cb17e94dec4043b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.5/agx-1.13.5-darwin-x64.tar.gz"
      sha256 "939542ec0762ad68e553407fa9a4c87b7dbab1a48cf0411dd642eda85a13de99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.5/agx-1.13.5-linux-arm64.tar.gz"
      sha256 "921b5a7ee2e8144c36497c21cec8fe36a1c940ebb074dc2b59d47c85e75aa940"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.5/agx-1.13.5-linux-x64.tar.gz"
      sha256 "90a361e19ba1d019f90cc106f36b8ebc2ced394ca980d663e023ea8f5afbb060"
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
