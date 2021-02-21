### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 4dcf2c90-736b-11eb-15f9-fb655d7d32a1
begin
	using Plots
	pyplot()
	using Random
	deck=52
	randcards=5
	jack=4
	arr=[]
	for i in 0:4
		push!(arr,binomial(jack,i)*binomial(deck-jack,randcards-i)/binomial(deck,randcards))
	end
	plot(0:4,arr,xlabel="Number of jacks drawn",ylabel="Probability",legend=false)
end

# ╔═╡ 300b0bd2-736a-11eb-1251-f955a74628ba
md"# Problem 3"

# ╔═╡ 5f8d9020-736b-11eb-371f-1f7edca98cbc
md"# (a) without Replacement"

# ╔═╡ 18ad1d40-736d-11eb-0ae0-cf7ad5d72b3f
md"# (b) with Replacement"

# ╔═╡ 29ddbfc0-736d-11eb-27bc-2bed6ddc1d09
begin
	arr1=[]
	for i in 0:randcards
		push!(arr1,binomial(5,i)*(4/52)^(i)*(48/52)^(5-i))
	end
	plot(0:5,arr1,xlabel="Number of jacks drawn",ylabel="Probability",legend=false)
end

# ╔═╡ Cell order:
# ╠═300b0bd2-736a-11eb-1251-f955a74628ba
# ╠═5f8d9020-736b-11eb-371f-1f7edca98cbc
# ╠═4dcf2c90-736b-11eb-15f9-fb655d7d32a1
# ╠═18ad1d40-736d-11eb-0ae0-cf7ad5d72b3f
# ╠═29ddbfc0-736d-11eb-27bc-2bed6ddc1d09
