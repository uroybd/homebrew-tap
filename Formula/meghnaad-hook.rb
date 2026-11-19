class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.12/meghnaad-hook-0.8.12-aarch64-apple-darwin.tar.gz"
      sha256 "28c5e255f202093058e916b317f675d53c17634b4e891af51a05c289eb83a35c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.12/meghnaad-hook-0.8.12-x86_64-apple-darwin.tar.gz"
      sha256 "37405fca27cb6a5c8764e9d74a49b725e809c7bdfbe1957294476f6a3057f115"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.12/meghnaad-hook-0.8.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e0f8478accbacf361c9d1c272686a7a7fea835ff09d412970fb06fa7c1d911d3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.12/meghnaad-hook-0.8.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd70cd9f996a5d4e62dbbcf6d76c05b79b6a1d9e1863d0cbf3f44e47ecc81efb"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.12/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
