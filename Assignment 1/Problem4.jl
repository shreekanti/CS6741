### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ f39c5cc2-7379-11eb-1980-ab8cbc1309af
md"# Problem 4"

# ╔═╡ 376348b0-737a-11eb-17b6-5549dc8fabb7
md"# (a)With simple probability Theory"

# ╔═╡ 4ce91480-737a-11eb-3bf8-618f14d705c4
1-(binomial(8,0)*(1/78)^0*(77/78)^8+binomial(8,1)*(1/78)^1*(77/78)^7)

# ╔═╡ ff9f0220-7379-11eb-29f3-b3a899d2d2d4
md"# (b)With experiments"

# ╔═╡ 38d4fac0-7372-11eb-2b2b-45046dfc9d92
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
		if(count>=2)
			a=a+1
		end
	end
	(a/10^6)
end

# ╔═╡ Cell order:
# ╠═f39c5cc2-7379-11eb-1980-ab8cbc1309af
# ╠═376348b0-737a-11eb-17b6-5549dc8fabb7
# ╠═4ce91480-737a-11eb-3bf8-618f14d705c4
# ╠═ff9f0220-7379-11eb-29f3-b3a899d2d2d4
# ╠═38d4fac0-7372-11eb-2b2b-45046dfc9d92
