class MediawikiMcpServer < Formula
  desc "MCP server for MediaWiki - search, read, edit wiki pages via Model Context Protocol"
  homepage "https://github.com/olgasafonova/mediawiki-mcp-server"
  version "1.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olgasafonova/mediawiki-mcp-server/releases/download/v#{version}/mediawiki-mcp-server-mac-apple-silicon"
      sha256 "fee4ce60450c50f35d007cefc611e5728852ece5cc488b9485a30f8bf4983b96"
    else
      url "https://github.com/olgasafonova/mediawiki-mcp-server/releases/download/v#{version}/mediawiki-mcp-server-mac-intel"
      sha256 "f829a5c1028651fd054368462bec82b1724f6c888e72c2b68e10164e9424fa92"
    end
  end

  on_linux do
    url "https://github.com/olgasafonova/mediawiki-mcp-server/releases/download/v#{version}/mediawiki-mcp-server-linux"
    sha256 "60f2874839680381a22edba609d7d1076b93a3fb0bad271b5963d223d5c08bef"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "mediawiki-mcp-server-mac-apple-silicon" => "mediawiki-mcp-server"
    elsif OS.mac?
      bin.install "mediawiki-mcp-server-mac-intel" => "mediawiki-mcp-server"
    else
      bin.install "mediawiki-mcp-server-linux" => "mediawiki-mcp-server"
    end
  end

  def caveats
    <<~EOS
      To use mediawiki-mcp-server, set the environment variable:
        export MEDIAWIKI_URL="https://your-wiki.com/w/api.php"

      For editing capabilities, also set:
        export MEDIAWIKI_USERNAME="your-username"
        export MEDIAWIKI_PASSWORD="your-password"

      Add to Claude Desktop config (~/.config/claude/claude_desktop_config.json):
        {
          "mcpServers": {
            "mediawiki": {
              "command": "mediawiki-mcp-server",
              "env": {
                "MEDIAWIKI_URL": "https://your-wiki.com/w/api.php"
              }
            }
          }
        }
    EOS
  end

  test do
    assert_match "MediaWiki MCP Server", shell_output("#{bin}/mediawiki-mcp-server --help 2>&1", 1)
  end
end
