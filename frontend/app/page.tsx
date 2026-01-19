import Image from "next/image";
import LoginBg from "../public/Login-bg 1.png";
import {
  Card,
  CardContent,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

export default function Home() {
  return (
    <div className="relative min-h-screen">
      <Image
        src={LoginBg}
        alt="Login Background"
        fill
        className="object-cover z-0"
        priority
      />
      <div className="relative z-10 flex min-h-screen items-center justify-center">
        <Card className="w-[440px] h-[600px] max-w-sm bg-[#192347] border-none">
          <CardHeader>
            <CardTitle className="text-white">Login</CardTitle>
          </CardHeader>
          <CardContent>
            <form>
              <div className="grid w-full items-center gap-4">
                <div className="grid w-full items-center gap-1">
                  <Label htmlFor="email" className="text-white">
                    Email
                  </Label>
                  <Input
                    id="email"
                    type="email"
                    placeholder="email@example.com"
                    className="w-full"
                  />
                </div>
                <div className="grid w-full items-center gap-1">
                  <Label htmlFor="password" className="text-white">
                    Password
                  </Label>
                  <Input
                    id="password"
                    type="password"
                    placeholder="password"
                    className="w-full"
                  />
                </div>
              </div>
            </form>
            <CardFooter className="flex justify-between">
              <Button type="submit" className="bg-[#192347] text-white">
                Login
              </Button>
            </CardFooter>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
