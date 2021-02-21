### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 336d7f60-7428-11eb-276b-c390ea6034c8
begin
	using Plots
		pyplot()
		using Random
	bag = Array[[1 1 1 1 1 1 1 1 1 0], [1 1 1 1 1 1 1 1 0 0], [1 1 1 1 1 1 1 0 0 0], [1 1 1 1 1 1 0 0 0 0], [1 1 1 1 1 0 0 0 0 0 ], [1 1 1 1 0 0 0 0 0 0], [1 1 1 0 0 0 0 0 0 0], [1 1 0 0 0 0 0 0 0 0], [1 0 0 0 0 0 0 0 0 0], [0 0 0 0 0 0 0 0 0 0]]
	p=[0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0]
	ans=[]
end

# ╔═╡ 88bbd5d0-7427-11eb-1eec-73aabbe5adbf
md"# Problem 8"

# ╔═╡ 33174910-7428-11eb-240e-81aecdbc0f32
begin
	for k in 1:10
		count = 0
		for i in 1:10^6
			rupee = 10
			flag = 0
			for j in 1:20
				a = rand(bag[k])
				if a == 1
					rupee += 1
				elseif a == 0
					rupee -= 1
					if rupee == 0
						if flag == 0
							flag = 1
							break
						end
					end
				end
			end
			if flag == 0 && rupee >= 10
				count += 1
			end
		end
		push!(ans,count/10^6)
	end
end

# ╔═╡ 32c90200-7428-11eb-3e68-37ea378ec095
for i in 1:10
		println("p=",p[i],"       ","Respective probability=",ans[i])
end

# ╔═╡ 31ebe870-7428-11eb-0775-d93488732cdf
begin
	scatter(p, ans, label = "point")
	plot!(p, ans, xlabel = "values of p", ylabel = "Respective Probability", label = "line")
end

# ╔═╡ Cell order:
# ╠═88bbd5d0-7427-11eb-1eec-73aabbe5adbf
# ╠═336d7f60-7428-11eb-276b-c390ea6034c8
# ╠═33174910-7428-11eb-240e-81aecdbc0f32
# ╠═32c90200-7428-11eb-3e68-37ea378ec095
# ╠═31ebe870-7428-11eb-0775-d93488732cdf
