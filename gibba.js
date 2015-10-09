// this script will watch for points on a given anchor and scroll down to where the anchor lives

// example:
// <nav>
//	<ul>
//		<li><a href="#stuff"></a>Go To Our New Stuff</li>
//	</ul>
// </nav>
//
// <div>
//	<h2><a id="stuff"></a>Buy Our New Stuff Below:</h2>
// </div>

// that would ^ take you from that anchor tag down to the new stuff with a given time in MS smooth scrolling on the page, you don't have to say
// onclick or anything
// just include the script below within the
// <script></script> tags respectively

// relies on jQuery which we definitely have because it gets loaded into the shop head page

// lets establish an event listener
$('a[href^="#"]').on('click', function(event){
	// lets tell it where it is headed
	var pageTarget = $(this.href);

	// if targets are not 0
	if( pageTarget.length ){
		// stop it from trying to load page on target
		event.preventDefault();

		// lets animate the scrollTop function and animate within the html/body
		$('html, body').animate({
			// on the scroll top function tell it the position of our
			// pageTarget anchor we are headed to lets pass in the top position
			// of that element into the scrollTop function
			scrollTop: pageTarget.offset().top
			// now lets close this and pass in our length in ms for our animate
		}, 1000);
		// gibba/whoever the ^ 1000 integer can be increased or decreased depending on how fast you want to scroll up or down to that target/element
	}

});
