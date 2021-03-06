import Vapor

let drop = Droplet()

drop.get("hello") { request in
    return "Hello, world!"
}

drop.get("hello/info") { request in
    return "This is the page where we could show more info"
}

// ROOT
drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "Dynamo-server"]
    ])
}

drop.get("favicon.ico") { req in
    return try drop.view.make("image/favicon.ico")
}
drop.get("apple-touch-icon-precomposed.png") { req in
    return try drop.view.make("image/favicon/apple-touch-icon-precomposed.png")
}
drop.get("apple-touch-icon.png") { req in
    return try drop.view.make("image/favicon/apple-touch-icon.png")
}
drop.get("apple-icon-180x180.png") { req in
    return try drop.view.make("/images/favicon/apple-icon-180x180.png")
}
drop.get("apple-icon-152x152.png") { req in
    return try drop.view.make("images/favicon/apple-icon-152x152.png")
}
drop.get("apple-icon-144x144.png") { req in
    return try drop.view.make("images/favicon/apple-icon-144x144.png")
}


// ANIMATION
drop.get("animation") { request in
    return try drop.view.make("dynamo.html")
}
drop.get("dynamo_hype_generated_script.js") { request in
    return try drop.view.make("dynamo/dynamo_hype_generated_script.js")
}
drop.get("HYPE-576.thin.min.js") { request in
    return try drop.view.make("dynamo/HYPE-576.thin.min.js")
}
drop.get("dynamo_logo.png") { request in
    return try drop.view.make("dynamo/dynamo_logo.png")
}
drop.get("PIE.htc") { request in
    return try drop.view.make("dynamo/PIE.htc")
}

// DICTIONARY
drop.get("hello/info") { request in
    return "This is the page where we could show more info"
}

drop.resource("posts", PostController())

drop.run()
