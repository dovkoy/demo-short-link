// BH

import { getShortLinksForUser } from '@/lib/db/queries';

export async function GET() {
  const createdShortLinks = await getShortLinksForUser()
  return Response.json(createdShortLinks);
}