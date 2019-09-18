module BlockchainIoRails
	class Version
	  	MAJOR = 0 # inclui alterações de API e pode quebrar compatibilidade com versões anteriores
	    MINOR = 1 # inclui novas funcionalidades, sem quebrar APIs existentes
	    PATCH = 1 # corrige bugs ou traz melhorias em implementações já existentes
	    STRING = "#{MAJOR}.#{MINOR}.#{PATCH}"
	end
end
