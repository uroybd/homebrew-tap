class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.7.1/meghnaad-hook-0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "c553c42de8d0e33049fcd4544d37e7e51541f8c316fd1c9ca672586aa0524db1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.7.1/meghnaad-hook-0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "78e6c1493ce594bac0ab1a937eb538cd96b3a75585fd180fe6fb9c207307c0d0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.7.1/meghnaad-hook-0.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe49b81de6ced00045c8381026349d2d1b1e47d779613e537aaac07163093b94"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.7.1/meghnaad-hook-0.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f35990d553b6807976143a23da845cc8afb98e36784769eea4895526e09dc5bb"
    end
  end

  def install
    bin.install "meghnaad-hook"
  end

  def caveats
    <<~EOS
      Point task at your script, once (and again when it defines a hook it did not before):
        meghnaad-hook check ~/hooks.lua
        meghnaad-hook install ~/hooks.lua
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.7.1/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
