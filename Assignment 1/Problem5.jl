### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 77b13120-7393-11eb-01fd-5b6e4e23eec4
md"# Problem 5"

# ╔═╡ 59936232-7393-11eb-2a6d-09caec8f5a43
begin
	arr=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',0,1,2,3,4,5,6,7,8,9,'~','!','@','#','$','%','^','&','*','(',')','_','+','=','-','`']
	arr1=[]
	a=0
	for l in 1:8
		push!(arr1,rand(arr))
	end
	for i in 1:10^6
		flag=[]
		count=0
		for j in 1:8
			push!(flag,rand(arr))
		end
		for k in 1:8
			if(arr1[k]==flag[k])
				count=count+1
			end
		end
		if(count>=3)
			a=a+1
		end
	end
	(a/10^6)
end

# ╔═╡ Cell order:
# ╠═77b13120-7393-11eb-01fd-5b6e4e23eec4
# ╠═59936232-7393-11eb-2a6d-09caec8f5a43
