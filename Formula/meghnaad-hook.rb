class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.9.0/meghnaad-hook-0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "f6ce55dd835d41fb82dec3b0cf048e2400fca61eb073375dfb5538d7f9164383"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.9.0/meghnaad-hook-0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "303291995f981b4be07ae12bedd226804ae95cbf1e47fd571a97a6111ad1066c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.9.0/meghnaad-hook-0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f0e92b03ca346496016ae82a77308437387956108fd7a15259483a607983559e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.9.0/meghnaad-hook-0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "13b70f36d1fc0c6a1e0bcab82934fdb4624953e78780ba6c1518f638caf2e997"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.9.0/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
