
def encrypt(text)
	normal = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	#encoding=normal.split('').shuffle.join
	encoding="MOhqm0PnycUZeLdK8YvDCgNfb7FJtiHT52BrxoAkas9RWlXpEujSGI64VzQ31w"
	return text.tr(normal, encoding)
end

def decrypt(text)
	normal = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	#encoding=normal.split('').shuffle.join
	encoding="MOhqm0PnycUZeLdK8YvDCgNfb7FJtiHT52BrxoAkas9RWlXpEujSGI64VzQ31w"
	
	return text.tr(encoding, normal)
end

puts "encrpt and decrypt"
message=encrypt("This is a secret:")
puts message.gsub(' ', '')
puts decrypt(message)
puts "\n"

def caesar_cipher_encrypt(text, n)
	normal_arr = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a + [' ']
	length=normal_arr.length
	hash={}
	text_arr=text.split(//)

	i=0
	j=0
	n=n.to_i

	while i<length
		if i+n<length
			hash[normal_arr[i]]=normal_arr[i+n]
		else
			hash[normal_arr[i]]=normal_arr[i+n-length]
		end
		i+=1
	end

	while j<text_arr.length
		hash.each do |k,v| 
			if text_arr[j]==k
				text_arr[j]=v 
				break
			end
		end
		j+=1
	end
	return text_arr
end

def caesar_cipher_decrypt(text, n)
	normal_arr = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a + [' ']
	length=normal_arr.length
	hash={}
	text_arr=text.split(//)

	i=0
	j=0
	n=n.to_i

	while i<length
		(i+n<length )? (hash[normal_arr[i]]=normal_arr[i+n]) : ( hash[normal_arr[i]]=normal_arr[i+n-length])
		i+=1
	end

	while j<text_arr.length
		hash.each do |k,v| 
			if text_arr[j]==v
				text_arr[j]=k
				break
			end
		end
		j+=1
	end
	return text_arr
end

puts "caesar cipher encrypt and decrypt test:"
message=''
message=caesar_cipher_encrypt("This is a secret", 5).join('')
puts message
puts caesar_cipher_decrypt(message, 5).join('')

