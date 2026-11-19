class MeghnaadHook < Formula
  desc "Your Meghnaad Lua hooks script, as hooks for the real Taskwarrior task"
  homepage "https://github.com/uroybd/Meghnaad"
  version "0.8.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.23/meghnaad-hook-0.8.23-aarch64-apple-darwin.tar.gz"
      sha256 "74869c03faf4d315b525b07bab12b5b0164e87d2d15dfb6ed2d83c7a9be91488"
    end
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.23/meghnaad-hook-0.8.23-x86_64-apple-darwin.tar.gz"
      sha256 "10031f9f8b32c308c5e2cb20605fab413a108d38aebcc93819300469e084f486"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.23/meghnaad-hook-0.8.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e8344651b49f554eda3de00c0451a10d6ed4693c5c5b259a291de0685291f72"
    end
    if Hardware::CPU.arm?
      url "https://github.com/uroybd/Meghnaad/releases/download/v0.8.23/meghnaad-hook-0.8.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "03a6e40475ec3a38f8b5df0e5d7b4c04671865e02b54ca65956411fd026988ba"
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
      How it works: https://github.com/uroybd/Meghnaad/blob/v0.8.23/docs/using/hooks.md#the-same-script-with-the-real-task
    EOS
  end

  test do
    (testpath/"hooks.lua").write "function on_add(task) end"
    assert_match "defines on_add", shell_output("#{bin}/meghnaad-hook check #{testpath}/hooks.lua")
  end
end
