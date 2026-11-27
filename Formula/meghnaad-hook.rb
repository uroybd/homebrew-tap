class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.72"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.72/meghnaad-hook-0.8.72-aarch64-apple-darwin.tar.gz"
      sha256 "7a0336f2e374836186ffd8764e895890cd69709ab07dc5645bb17c93b5e387f7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.72/meghnaad-hook-0.8.72-x86_64-apple-darwin.tar.gz"
      sha256 "4cbd470cab11b72f34506677181d900a00de39e54d2aa0024d7998ee06445ec6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.72/meghnaad-hook-0.8.72-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4fc4ff8cb4f91b4359efcd8b6abc719fa6895e45fca1c1da1f96d2e81e4b808f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.72/meghnaad-hook-0.8.72-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "17ffaef47627c1089f54d7bfce46b28fb05f8e995a90c708bb535fc9db082dc9"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.72/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
