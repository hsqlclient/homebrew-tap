class Hsqlclient < Formula
    desc "HSQL client"
    homepage "https://github.com/hsqlclient/hsqlclient"
    url "https://sourceforge.net/projects/hsqldb/files/hsqldb/hsqldb_2_7/hsqldb-2.7.3.zip/download"                                                                                                                                                            ;url "https://github.com/hsqlclient/hsqlclient/releases/download/2.7.3/hsqldb-2.7.3.zip"    
    sha256 "4662d28fb72c65cdf5b13c95c07cd7867987466612079f057df3d762094d9c26"
    license "MIT"
    revision 2
    
    def install
        bin.install Dir["*"]
        (bin/"hsqlclient").write <<~EOS
        #!/bin/bash
        java -cp "#{prefix}/bin/hsqldb.jar" -Djavax.net.debug=ssl org.hsqldb.util.DatabaseManagerSwing "$@" 
        EOS
        chmod 0755, bin/"hsqlclient"
    end

    def post_install
        rm "#{HOMEBREW_PREFIX}/bin/hsqldb.jar"
        
        output = `java --version`
        puts output; 
        
        output = `java --help`
        puts output

        ohai "HSQL client installed successfully!"
        ohai "Run 'hsqlclient --help' for usage information."
        
        output = `hsqlclient --help`
        puts output        
    end

    test do
        system "hsqlclient", "--help"
    end
  end
  
