import XCTest
import CCairo
import Cairo
import Pango
@testable import PangoCairo

class PangoCairoTests: XCTestCase {

    func testPangoCairoContext() {
        let w = 320
        let h = 240
        let surface = imageSurfaceCreate(format: CAIRO_FORMAT_ARGB32, width: w, height: h)
        guard let cp = cairo_create(surface.ptr) else { XCTFail() ; return }
        let cairo_context = cairo.Context(cp)
        guard let ptr = createContext(cr: cairo_context) else { XCTFail() ; return }
        let context = Pango.Context(ptr)
        XCTAssertNotNil(context.fontMap)
        XCTAssertNotNil(context.fontDescription)
        XCTAssertNotNil(context.gravityHint)
        XCTAssertNotNil(context.matrix)
        let serial = context.serial
        context.changed()
        XCTAssertEqual(context.serial, serial + 1)
    }

}
extension PangoCairoTests {
    static var allTests : [(String, (PangoCairoTests) -> () throws -> Void)] {
        return [
            ("testPangoCairoContext", testPangoCairoContext),
        ]
    }
}
